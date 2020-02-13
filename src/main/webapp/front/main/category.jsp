<%@page contentType="text/html;charset=utf-8" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<div class="book_l_border1" id="__FenLeiLiuLan">
	<div class="book_sort_tushu">
		<h2>
			分类浏览
		</h2>
		
		<!--1级分类开始-->
			<c:forEach items="${requestScope.list }" var = "category1">
			<div class="bg_old" onmouseover="this.className = 'bg_white';"
				onmouseout="this.className = 'bg_old';">
			
				<h3>
					[<a href='${path }/book/queryOneTwoCategory?fid=${category1.id}'>${category1.cateName }</a>]
				</h3>
				<ul class="ul_left_list">
					<c:forEach items="${category1.categoryList }" var = "category2">
						<!--2级分类开始-->
						<li>
							<a href='${path }/book/queryOneTwoCategory?fid=${category1.id}&sid=${category2.id}'>${category2.cateName }</a>
						</li>
						<!--2级分类结束-->
					</c:forEach>
				</ul>
				<div class="empty_left">
				</div>
			</div>

			<div class="more2">
			</div>
		</c:forEach>
		<!--1级分类结束-->

		<div class="bg_old">
			<h3>
				&nbsp;
			</h3>
		</div>
	</div>
</div>
