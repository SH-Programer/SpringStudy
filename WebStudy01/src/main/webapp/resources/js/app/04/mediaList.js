let cPath
let mediaSel
let mediaform
let viewerArea

window.onload = async () => {


	cPath = document.body.dataset.cpath;
	mediaSel = document.querySelector(`[name="media"]`)
	mediaform = document.querySelector("#media-form")
	viewerArea = document.querySelector("#viewer-area")
	
	mediaform.addEventListener("submit", submitHandler)
	
	let options = await fetchFileList()
	console.log(options)
	mediaSel.append(...options)
}

function videoPlay(url) {
	let video = document.createElement("video")
	video.src = url
	video.controls = true
	
	viewerArea.replaceChildren(video)
}

function imageRender(url) {
	let img = document.createElement("img")
	img.src = url
	
	viewerArea.replaceChildren(img)
}

async function textPrint(url) {
	let div = document.createElement("div")
	let resp = await fetch(url)
	let text = await resp.text()

	div.innerText = text 
	viewerArea.replaceChildren(div)
	
}

function submitHandler(e) {
	e.preventDefault();
	let form = e.target
	let formData = new FormData(form)
	let params = new URLSearchParams(formData)
	
	let url = `${form.action}?${params.toString()}`
	console.log(url)
	
	let selectedOption = mediaSel.querySelector("option:checked")
	let mime = selectedOption.dataset.mime
	let slashPoint = mime.indexOf("/")
	let mainType = mime.slice(0, slashPoint)
	
	switch(mainType) {
		case "image":
			imageRender(url)
			break
		case "video":
			videoPlay(url)
			break
		case "text":
			textPrint(url)
			break
		default:
			console.error("처리할 수 없는 미디어를 선택 했음")
	}
	
}

function makeOption(dto) {
	
	let option = document.createElement("option")
	option.value = dto.relativePath
	option.label = dto.fileName
	option.dataset.mime = dto.mime
	
	return option
	
}

async function fetchFileList() {

	const resp = await fetch(`${cPath}/media/list`);
	const dtoList = await resp.json();
	const optionsList = [...dtoList["dtoList"]]
	const options = optionsList.map(makeOption)

	return options
	
}