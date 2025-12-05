
let form = null;

window.onload = () => {
	
	form = document.querySelector("#form")
	const getBtn = document.querySelector("#get-btn")	
	const postBtn = document.querySelector("#post-btn")
	const postBtnMultipart = document.querySelector("#post-btn-multipart")
	const postBtnJson = document.querySelector("#post-btn-json")
	
	
	getBtn.addEventListener("click", getHandler)		
	postBtn.addEventListener("click", postHandler)		
	postBtnMultipart.addEventListener("click", postMultipartHandler)		
	postBtnJson.addEventListener("click", postJSONHandler)
}

const getHandler = (e) => {
	const formData = new FormData(form)
	const params = new URLSearchParams(formData)
	fetch(`${form.action}?${params}`, {
		method: "get",
		headers: {
			"accept": "*/*"
		}
	})
}

const postHandler = (e) => {
	const formData = new FormData(form)
	const params = new URLSearchParams(formData)
	fetch(`${form.action}`, {
		method: "post",
		headers: {
			// "Content-Type": "application/x-www-form-urlencoded"
		},
		body: params
	})
}

const postMultipartHandler = (e) => {
	const formData = new FormData(form)
	fetch(`${form.action}`, {
		method: "post",
		headers: {
			// "Content-Type": "multipart/form"
		},
		body: formData
	})
}

const postJSONHandler = (e) => {
	
	const formData = new FormData(form)
	
	let json = {
		textParam: formData.get("textParam"),
		numParam: Number(formData.get("numParam")),
		dateParam: formData.get("dateParam"),
		datetimeParam: formData.get("datetimeParam"),
		radioParam: formData.get("radioParam"),
		checkParam: formData.getAll("checkParam"),
		singleSel: formData.get("singleSel"),
		multiSel: formData.getAll("multiSel")
	}
	
	fetch(`${form.action}`, {
		method: "post",
		headers: {
			"Content-Type": "application/json"
		},
		body: JSON.stringify(json)
	})
}
