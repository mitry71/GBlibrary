
var input1=document.querySelectorAll('input[type="radio"]');
for(var i=0; i<input1.length; i++) {
    input1[i].addEventListener('click', check1);
}

var input2=document.querySelectorAll('input[type="checkbox"]');
for(var i=0; i<input2.length; i++) {
    input2[i].onchange = function() {
        if(this.checked == true) {
            this.parentNode.style.backgroundColor="rgb(254, 221, 66)";
        }else {
            this.parentNode.style.backgroundColor="#fff";
        }
    }
}

function check1() {
    var checked=document.querySelector('input[type="radio"]:checked');
    var notchecked=document.querySelectorAll('input[type="radio"]:not(:checked)');
    checked.parentNode.style.backgroundColor='rgb(254, 221, 66)';
    for(var i=0; i<notchecked.length; i++) {
        notchecked[i].parentNode.style.backgroundColor='#fff';
    }
}