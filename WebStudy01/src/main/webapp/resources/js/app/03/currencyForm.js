/**
 * 
 */

window.onload = () => {
	const form = document.querySelector("#currency-form");
	const resultArea = document.querySelector("#result-area")
	// 폼태그의 동기 요청을 비동기로 전환하는 전형적 코드
	form.addEventListener("submit", (e) => {

		e.preventDefault();

		let amountValue = form.amount.value;
		let targetURL = "../04/exchange-rate"
		let json = {
			amount: amountValue
		}
		
		console.log(json)
		fetch(targetURL)
		.then((res) => res.json())
		.then((data) => {
			console.log(data)
			let result = amountValue / data.rate
			resultArea.innerHTML = result
		})
		.catch((error) => {
			console.log(error)
		})

	});
}