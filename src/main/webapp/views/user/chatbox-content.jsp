<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty chatHistory}">
  <c:set var="lastMsg" value="${chatHistory[chatHistory.size()-1]}" />
  <c:if test="${lastMsg.role eq 'bot'}">
    <div class="text-start">
      <div class="chat-bubble bot">${lastMsg.content}</div>
    </div>
  </c:if>
</c:if>

<c:if test="${not empty recommendedProduct}">
  <div class="card product-card shadow mt-3">
    <div class="row g-0">
      <div class="col-md-4">
        <img src="${pageContext.request.contextPath}/images/products/${recommendedProduct.image}" class="img-fluid rounded-start" alt="${recommendedProduct.name}">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title">${recommendedProduct.name}</h5>
          <p class="card-text">${recommendedProduct.description}</p>
          <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="productId" value="${recommendedProduct.id}" />
            <input type="hidden" name="quantity" value="1" />
            <button type="submit" class="btn btn-success">? Thêm vào gi? hàng</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</c:if>
