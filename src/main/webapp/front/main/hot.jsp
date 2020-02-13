<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<link href="${path }/front/css/glassstyle.css" rel="stylesheet"></link>
<script type="text/javascript" src="${path }/front/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${path }/front/js/lightzoom.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('.light-zoom').lightzoom({
		zoomPower   : 3,    //Default
		glassSize   : 180,  //Default
	});
});
</script>
<h2>
	<span class="more"><a href="#" target="_blank">更多&gt;&gt;</a> </span>热销图书
</h2>
<div class="book_c_04">

	<!--热销图书A开始-->
	<c:forEach items="${requestScope.bookHot }" var="book">
	<div class="second_d_wai">
		<div class="img">
			<a href="${path }/book/queryDetailBook?id=${book.id}" target='_blank'>
				<img class = "light-zoom" src="${path }/upload/imgFile/${book.src}" border=0 />
			</a>
		</div>
		<div class="shuming">
			<a href="${path }/book/queryDetailBook?id=${book.id}" target="_blank">${book.bookName }</a><a href="#" target="_blank"></a>
		</div>
		<div class="price">
			定价：${book.price }
		</div>
		<div class="price">
			当当价：${book.ddPrice }
		</div>
		<div class="price">
			销量：<font color="red">${book.saleCount }</font>
		</div>
	</div>
	<div class="book_c_xy_long"></div>
	<!--热销图书A结束-->
	</c:forEach>
</div>
<div class="clear"></div>