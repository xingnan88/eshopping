var xmlhttp;

function createXMLHttpRequest() {

	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
}


function sendRequest(url) {
	createXMLHttpRequest();
	xmlhttp.open("GET", url, true);
	xmlhttp.onreadystatechange = processResponse;
	xmlhttp.send();
}
