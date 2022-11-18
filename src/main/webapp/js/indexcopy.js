//도서검색창 배경이미지
var mainSearch=document.querySelector("#main > .main-search");
setInterval(changeBG, 6000);
var toggle=false;
function changeBG() {
    if(toggle==false) {
        mainSearch.style.backgroundImage="url('images/inaki-del-olmo-NIJuEQw0RKg-unsplash.jpg')";
        mainSearch.style.backgroundPosition="center center";
        toggle=true;
    }else {
        mainSearch.style.backgroundImage='url("images/alfons-morales-YLSwjSy7stw-unsplash.jpg")';
        mainSearch.style.backgroundPosition="0 23.25%";
        toggle=false;
    }
}

//이미지 슬라이드
var index=0;
moveSlider(index);
function moveSlider(index) {
    $('div.notice-image').animate({
        left:-(408*index)
    },200);
    $('.notice-button').css('top','0');
    $('.notice-button').eq(index).css('top','-30px');
}
$('.notice-button').click(function() {
    index=$(this).index();
    moveSlider(index);
    $('.notice-button').css('top','0');
    $(this).css('top','-30px');
});
setInterval(function() {
    index++;
    if(index==7) {
        index=0;
        $('div.notice-image').css('left','0');
    }
    moveSlider(index);
},4500);

//신착, 추천, 베스트 대출도서 탭메뉴
const bookTab=document.querySelectorAll('.book_menu_tab');
const tabContent=document.querySelectorAll('.book_tab');
for(let i=0; i<bookTab.length; i++) {
    bookTab[i].onclick = function (event) {
        event.preventDefault();
        for(let j=0; j<tabContent.length; j++) {
            tabContent[j].style.zIndex=0;
            bookTab[j].style.color='#212529';
        }
        tabContent[i].style.zIndex=100;
        bookTab[i].style.color='rgb(5, 5, 180)';
    }
}