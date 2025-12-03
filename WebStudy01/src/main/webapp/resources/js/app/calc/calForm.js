
const fnObjects = {
   renderHtml: async function(resp, serverArea) {
      const html = await resp.text();
      serverArea.innerHTML = html;
   },
   
   renderJson: async function(resp, serverArea) {
      const { expression } = await resp.json();
      serverArea.innerHTML = expression;
   }
}

document.addEventListener("DOMContentLoaded", () => {
	const resultArea = document.querySelector("#result-area")
	document.getElementById("cal-form").addEventListener("submit", async (e) => {
		e.preventDefault();
		const calform = e.target;
		const checkedRadio = document.querySelector("[name='accept']:checked");
		const fnName = checkedRadio.dataset.fnName;
		// form 을 이용한 동기 요청을 비동기 요청으로 전환 : 
		// 요청을 전송하는 방식만 전환되고 나머지는 모든 요청의 조건이 동일하다.
		const url = calform.action;
		const method = calform.method;
		const headers = {
			"Content-Type": calform.enctype,
			"Accept" : checkedRadio.value
		};
		
		const fromData = new FormData(calform);
		const query = new URLSearchParams(fromData)
		const body = query;
		
		const resp = await fetch(url, {
			method, headers, body
		});
		
		try {
			if(resp.ok) {
				fnObjects[fnName](resp, resultArea)
			}
			else {
				throw new Error(`응답 상태 코드: ${resp.status}`)
			}			
		}
		catch(error) {
			console.error(error)
		}
	})
	
})