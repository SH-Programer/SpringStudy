
const formatter = Intl.DateTimeFormat(navigator.language);
const { locale:CLIENT_LOCALE, timeZone: CLIENT_TIMEZONE } = formatter.resolvedOptions();

window.onload = async () => {
	
	const localeSel = document.querySelector('[name="locale"]')
	localeSel.addEventListener("change", (e) => { timeZoneMake(e) })
	
	const clickForm = document.querySelector("#clock-form")
	clickForm.addEventListener("submit", async (e) => {
		e.preventDefault()
		const formData = new FormData(clickForm)
		const worldNow = await fetchServerTime(formData);
		console.log(worldNow)
		document.querySelector("#time-area").innerHTML = worldNow
	})
	
	localeSel.value = CLIENT_LOCALE
	localeSel.dispatchEvent(new Event("change"))
	
}

async function fetchServerTime(formData) {
	
	
	const resp = await fetch(`./world-now`, {
		method: "post",
		body: formData
	})
	
	const { worldNow } = await resp.json()
	
	return worldNow
	
}

async function timeZoneMake(e) {
	
	let tartget = e.target
	let locale = tartget.value
	
	const timeZones = await fetchTimezones(locale)
	const options = []
	for(let key in timeZones) {
		const option = document.createElement("option")
		option.value = key
		option.label = timeZones[key]
		option.selected = CLIENT_TIMEZONE === key;
		options.push(option)
	}
	
	const timeZoneSel = document.querySelector('[name="timeZone"]')
	timeZoneSel.replaceChildren(...options)
	
}

async function fetchTimezones(locale) {
	
	let result = null;
	
	await fetch(`./timezones?locale=${ locale }`)
	.then(res => res.json())
	.then((data) => {
		result = data.timeZones
	})
	
	return result
	
}