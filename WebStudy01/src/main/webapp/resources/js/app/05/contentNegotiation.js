let ContextPath = null;

window.onload = () => {
	
	ContextPath = document.querySelector("body").dataset['cp']
	eventHanlder()
	
}

function eventHanlder() {
	
	let getTimeBtn = document.querySelector("#fetch-time")
	getTimeBtn.addEventListener("click", (e) => { getTimeBtnHandle(e) })
	
	let timeStopBtn = document.querySelector("#fetch-time-stop")
	timeStopBtn.addEventListener("click", serverTimeStop)
	
}

let serverTimeInterval = null
function getTimeBtnHandle() {
	
	serverTimeInner()
	
	if(serverTimeInterval !== null) {
		// clearInterval(serverTimeInterval)
	}
	
	// serverTimeInterval = setInterval(() => {
		//serverTimeInner()
	// }, 1000)
	
}

async function serverTimeInner() {
	let serverData = await serverGetTimeServletCall()
	if(serverData.type === "text/html") {
		document.querySelector("#server-area").innerHTML = serverData.value	
	}
	else if(serverData.type === "application/json") {
		document.querySelector("#server-area").innerHTML = `
			<h1>타임존: ${serverData.value.timeZone}</h1>
			<h1>서버시간: ${serverData.value.serverNow}</h1>
		`
	}
}

async function serverGetTimeServletCall() {
	
	let result = {
		type: null,
		value: null
	}
	
	let types = document.querySelectorAll("input[name]")
	let type = null;
	for(let i=0 ; i<types.length ; i++) {
		if(types[i].checked) {
			type = types[i].value
		}
	}
	
	await fetch(`${ContextPath}/server-now`, {
		method: "get",
		headers: {
			"accept": type
		}
	})
	.then((res) => {
		let contentType = res.headers.get("content-type").split(";")[0]
		console.log(contentType)
		result.type = contentType
		if(contentType === "text/html") {
			return res.text();
		}
		else if(contentType === "application/json") {
			return res.json();
		}
	})
	.then((data) => {
		console.log(data)
		result.value = data
	})
	
	return result
}

function serverTimeStop() {
	clearInterval(serverTimeInterval)
}

// dot notation, associative array
// 