<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
	<h2 class="t_xsrm">
		新书热卖榜
	</h2>
	
	<div id="NewProduct_1_o_t" onmouseover="">
	<!--新书热卖图书开始-->
	<c:forEach items="${requestScope.bookHotBoard }" var="book">
	<ul>
		<li>&nbsp;&nbsp;&nbsp;
			<a  target='_blank' href="${path }/book/queryDetailBook?id=${book.id}">
				${book.bookName }
			</a>
		</li>
	</ul>
	<!--新书热卖图书结束-->
	</c:forEach>
	<h3 class="second">
		<span class="dot_r"> </span><a href="#" target="_blank">更多&gt;&gt;</a>
	</h3>
</div>
