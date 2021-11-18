const radius = 120;
const delta = 30;

function getDot() {
    const svgArea = document.getElementById("area");
    let rect = svgArea.getBoundingClientRect();
    let yCor = (event.clientY - rect.top);
    let xCor = (event.clientX - rect.left);
    const r = document.forms["form"]["r"].value
    const yVal = -((yCor - (radius + delta)) / radius) * r;
    const xVal = ((xCor - (radius + delta)) / radius) * r;
    sendRequest(xVal, yVal, r);
}


function sendRequest(x, y, r) {
    document.forms['form']['x'].value = x;
    document.forms['form']['y_value'].value = y;
    document.getElementById('submit').click();
}


function changeR() {
    const curR = document.forms['form']['r'].value.replace(/,/, '.');
    document.getElementById('radius-text-right').textContent = curR;
    document.getElementById('radius-text-bottom').textContent = '-' + curR;
    document.getElementById('radius-text-left').textContent = '-' + curR;
    document.getElementById('radius-text-top').textContent = curR;
}

document.getElementById('area').onclick = getDot;

