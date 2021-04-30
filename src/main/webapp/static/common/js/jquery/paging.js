/* 스크롤페이징 관련 추가 내용 S */
let scrollHeight = 0;
let scrollObject = null;
let lastPageYn = "N";			//마지막 페이지를 불러왔는지 여부(N일때만 이벤트 발생)
let scrollPageYn = "N";			//스크롤이벤트 실행 트리거(Y일때만 이벤트 발생)

fn_getScrollHeight = function() {
    // Max Height 확인
    scrollHeight = Math.max ( 
        document.body.scrollHeight
        , document.body.offsetHeight
        , document.body.clientHeight
        , document.documentElement.scrollHeight
        , document.documentElement.offsetHeight
        , document.documentElement.clientHeight
    );
};
/* 스크롤페이징 관련 추가 내용 E */

$( document ).ready(function() {


	/* 스크롤페이징 관련 추가 내용 S */
	// Scroll 이벤트 Listener 추가.
	$(window).scroll( function ( event ) {
		// 현재 Scroll 된 위치 확인
		var currentOffset = window.pageYOffset + document.documentElement.clientHeight;
		// Max Height 확인
		fn_getScrollHeight();
		// 이전에 실행된 타이머 Clear
		//clearTimeout(scrollObject);
		// console.log('currentOffset = {} , scrollHeight = {} ' , currentOffset , scrollHeight-200);
		// 제일 아래쪽에 도착했으면, 
		if ( currentOffset >= (scrollHeight-200) ) {
			
			// 1초 뒤에 데이터 조회 함수 호출
			if(lastPageYn != 'Y' && scrollPageYn == 'Y') {
				scrollPageYn = 'N';
				scrollObject = window.setTimeout( pagingSearch(), 500 );
			}
		}
	});
	/* 스크롤페이징 관련 추가 내용 E */
});