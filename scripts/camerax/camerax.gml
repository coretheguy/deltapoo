function camerax(){
	return __view_get(0, 0);
}

function cameray(){
	return __view_get(1, 0);
}

function camerawidth() {
	return __view_get(2, 0);
}

function cameraheight() {
	return __view_get(3, 0);
}

function camerax_set(arg0) {
	__view_set(0, 0, arg0)
	return;
}


function cameray_set(arg0) {
	__view_set(1, 0, arg0)
	return;
}