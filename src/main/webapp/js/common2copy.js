//폰트사이즈 조절
var largerFt=document.querySelector("#largerFont");
var smallerFt=document.querySelector("#smallerFont");
var all=document.querySelectorAll("*");
largerFt.onclick = large;
smallerFt.onclick = small;

function large() {
    for(var i=0; i<all.length; i++) {
        var comStyle=getComputedStyle(all[i]);
        var formerFt=parseInt(comStyle.getPropertyValue('font-size'));
        if(formerFt>=20) {
            all[i].style.fontSize='20px';
        }else {
            all[i].style.fontSize=(formerFt+1) + 'px';
        }
    }
}

function small() {
    for(var i=0; i<all.length; i++) {
        var comStyle=getComputedStyle(all[i]);
        var formerFt=parseInt(comStyle.getPropertyValue('font-size'));
        if(formerFt<=12) {
            all[i].style.fontSize="12px";
        }else {
            all[i].style.fontSize=(formerFt-1) + "px";
        }
    }
}

//서브메뉴 슬라이드다운
const menu=document.querySelector('.mainMenu');
const subMenu=document.querySelectorAll('.subMenu');
const subMenuBg=document.querySelector('#submenuBg');
menu.addEventListener('mouseover', showSubMenu);
menu.addEventListener('mouseout', hideSubMenu);
subMenuBg.addEventListener('mouseover', showSubMenu);
subMenuBg.addEventListener('mouseout', hideSubMenu);

function showSubMenu() {
    for(let i=0; i<subMenu.length; i++) {
        subMenu[i].style.display='block';
    }
    subMenuBg.style.display='block';
}
function hideSubMenu() {
    for(let i=0; i<subMenu.length; i++) {
        subMenu[i].style.display='none';
    }
    subMenuBg.style.display='none';
}

//왼쪽 사이드 메뉴 선택시 색상 변화
$('#container > .snb a').click(function() {
    $('#container > .snb a').removeClass('selected_menu');
    $(this).addClass('selected_menu');
});

//배너 슬라이드
$('div.box').append($('div.box > a').eq(0).clone());
$('div.box').append($('div.box > a').eq(1).clone());
$('div.box').append($('div.box > a').eq(2).clone());
$('div.box').prepend($('div.box > a').eq(-4).clone());
$('div.box').prepend($('div.box > a').eq(-5).clone());
$('div.box').prepend($('div.box > a').eq(-6).clone());
var index2=3;
moveSlider2(index2);
var auto=setInterval(function() {
    $('button.next').trigger('click');
}, 3000);
$('button.previous').click(function() {
    if(index2>1) {
        index2--;
        moveSlider2(index2);
    }else {
        $('div.box').css('left',-1600);
        index2=9;
        moveSlider2(index2);
    }
});
$('button.next').click(function() {
    if(index2<9) {
        index2++;
        moveSlider2(index2);
    }else {
        $('div.box').css('left',0);
        index2=1;
        moveSlider2(index2);
    }
});
var stop=false;
$('button.pause').click(function() {
    stop=!stop;
    if(stop) {
        clearInterval(auto);
    }else {
        auto=setInterval(function() {
            $('button.next').trigger('click');
        }, 3000);
    }
});

//슬라이더 함수
function moveSlider2(index2) {
    $('div.box').animate({
        left:-(160*index2)
    },'normal');
}