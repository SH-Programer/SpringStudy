
let contextPath;
let btns
 window.onload = () => {
	
	contextPath = document.querySelector("body").dataset['cp']
	RenderEventHandle()
	
 }
 
 function RenderEventHandle() {
	btns = document.querySelectorAll("body > div > button")
	for(let i=0 ; i<btns.length ; i++) {
		btns[i].addEventListener("click", (e) => { btnClickHandle(e) })
	}
 }
 
 function btnClickHandle(e) {
	let target = e.currentTarget
	let value = target.getAttribute("id")
	if(value == "enable-btn") {
		btns.forEach((el) => {
			el.disabled = false
		})
		return
	}
	let method = target.dataset['method']
	servletAsyncHandle(method)
	target.disabled = true
 }
 
 function servletAsyncHandle(mt) {
	fetch(`${contextPath}/06/method-check`, {
		method: mt,
	    headers: {
			// "Content-Type": "application/json"
		},
		// body: data
	})
	.then((res) => console.log(res))
	
 }