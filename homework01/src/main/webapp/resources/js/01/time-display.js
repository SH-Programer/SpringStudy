
window.onload = () => {
	console.log('12123')
	
	getClientTime()
	
	elementAddEventHandle()
}


function elementAddEventHandle() {
	
	let target = document.querySelector("#click")
	target.addEventListener("click", (e) => { serverTimeHandle(e) })
	
}

function getClientTime() {
	let target = document.querySelector("#clientSide")
	
	setInterval(() => {
		
		let time = new Date()
		target.innerHTML = `현재 클라이언트의 시각: ${time}`
		
	}, 1000)

}

async function serverTimeHandle(e) {
	e.preventDefault();
	
	let target = document.querySelector("#serverSide")
	const result = await getServerTime()
	target.innerHTML = `현재 서버의 시각: ${result.serverTime}`	
}


function getServerTime() {
	
	return axios({
		url: `${CONTEXTPATH}/01/server-now`,
		method: 'get',
	})
	.then(function (response) {
		console.log(response)
		return response.data
	})
	.catch(function (err) {
    	console.error(err);
	});
	
}






















