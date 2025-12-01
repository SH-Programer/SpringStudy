
console.log('12323')



window.onload = () => {
	
	const body = document.querySelector("body")
	const cp = body.dataset['cp']
	fetch(`${cp}/proxy/http-headers`, {
		method: "get"
	}).then((res) => res.text())
	.then((data) => {
		body.innerHTML = data
	})
	
}








