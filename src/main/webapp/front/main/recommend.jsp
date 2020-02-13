<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>

<link rel="stylesheet" type="text/css" href="${path }/front/css/normalize.css" /><!--CSS RESET-->

<link href="${path }/front/css/glassstyle.css" rel="stylesheet">
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
	编辑推荐
</h2>
<div id=__bianjituijian/danpin>
	<div class=second_c_02>
		<!--编辑推荐图书开始-->
		<c:forEach items="${requestScope.bookRecommend }" var="book">
		<div class=second_c_02_b1>
			<div class=second_c_02_b1_1>
				<a href='${path }/book/queryDetailBook?id=${book.id}' target='_blank'>
					<img class="light-zoom" src="${path }/upload/imgFile/${book.src}" width=70 border=0 />
				</a>
			</div>
			<div class=second_c_02_b1_2>
				<h3>
					<a href='${path }/book/queryDetailBook?id=${book.id}' target='_blank' title='输赢'>${book.bookName }</a>
				</h3>
				<h4>
					作者：${book.author } 著
					<br />
					出版社：${book.company }&nbsp;&nbsp;&nbsp;&nbsp;
					出版时间：${book.publishTime }
				</h4>
				<h5>
					简介:${book.brief }
				</h5>
				<h6>
					定价：${book.price }&nbsp;&nbsp;
					当当价：${book.ddPrice }
					销量：<font color="red">${book.saleCount }</font>
				</h6>
				<div class=line_xx></div>
			</div>
		</div>
		</c:forEach>
		<!--编辑推荐图书结束-->
		
	</div>
</div>
