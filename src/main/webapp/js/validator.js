const sendButton = document.getElementById('submit');

function validate() {
    const x = document.forms['form']['x'].value.replace(/,/, '.');
    const y = document.forms['form']['y_value'].value.replace(/,/, '.');
    const r = document.forms['form']['r'].value.replace(/,/, '.');

    if (isEmpty(x)) {
        document.getElementsByClassName('item-x')[0].style.background = 'red';
        alert('Enter x!');
    } else if (isEmpty(y)) {
        let yTable = document.getElementsByClassName('item-y');
        for (let i = 0; i < yTable; ++i) {
            yTable.item(i).style.background = 'red';
        }
        alert('Select y!');
    } else if (isEmpty(r)) {
        document.getElementsByClassName('r')
    } else {
        if (isNaN(x) || x < -3 || x > 5) {
            document.getElementsByClassName("item-x")[0].style.background = 'red';
            alert('x must be in range (-3;5);');
        }
        if (isNaN(y) || y < -5 || y > 3) {
            let yTable = document.getElementsByClassName('item-y');
            for (let i = 0; i < yTable; ++i) {
                yTable.item(i).style.background = 'red';
            }
            alert('y must be in range (-5;3)');

        }
        if (isNaN(r) || r < 1 || r > 3) {
            document.getElementsByClassName('r')[0].style.background = 'red';
            alert('r must be in range (1;3)');
        }


    }
}

function isEmpty(obj) {
    for (let key in obj) {
        return false;
    }
    return true;


}

function setY(value) {
    document.getElementById('y_hidden').value = value
}

sendButton.onclick = validate;