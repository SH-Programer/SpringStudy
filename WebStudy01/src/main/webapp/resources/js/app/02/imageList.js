 
 window.onload = async() => {
	
	let imageList = await imageListDBcall()
	imageListMakeHandle(imageList)
	
 }
 
 function imageListMakeHandle(list) {
	
	let content = ''
	for(let i=0 ; i<list.length ; i++) {
		content += `
			<option value="${ list[i] }">${ list[i] }</option>
		`
	}
	
	let target = document.querySelector("#imageListBox")
	target.insertAdjacentHTML("beforeend", content)
	
 } 
 
 async function imageListDBcall() {
	
	let result
	
	await fetch("http://localhost/ws01/03/image-list")
	.then((res) => res.json())
	.then((data) => {
		result = data
	})
	.catch((error) => {
		console.log(error)
	})
	return result
	
 }