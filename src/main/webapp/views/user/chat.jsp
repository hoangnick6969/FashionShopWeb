<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Trò chuyện với cửa hàng</title>
    <style>
        body { font-family: Arial; margin: 0; padding: 0; }
        .container {
            max-width: 800px; margin: 20px auto;
            border: 1px solid #ccc; padding: 20px;
            display: flex; flex-direction: column;
            height: 80vh;
        }
        .chat-box {
            flex: 1; overflow-y: auto;
            border: 1px solid #ccc;
            padding: 10px; margin-bottom: 10px;
            display: flex; flex-direction: column;
        }
        .message {
            padding: 8px; margin: 5px 0; border-radius: 6px; max-width: 70%;
        }
        .from-user { background-color: #d4edda; align-self: flex-end; }
        .from-admin { background-color: #f8d7da; align-self: flex-start; }
        .message small {
            display: block; font-size: 10px; color: gray;
        }
        form#sendForm { display: flex; gap: 5px; }
        form#sendForm input[type="text"] { flex: 1; padding: 8px; }
    </style>
</head>
<body>

<div class="container">
    <h3>Trò chuyện với quản trị viên</h3>

    <div class="chat-box" id="chatBox"></div>

    <form id="sendForm" action="${pageContext.request.contextPath}/user/conversation" method="post">
        <input type="text" name="message" id="messageInput" placeholder="Nhập tin nhắn..." required />
        <button type="submit">Gửi</button>
    </form>
</div>

<script>
function loadMessages() {
    fetch('${pageContext.request.contextPath}/user/chat-ajax')
        .then(res => {
            if (!res.ok) throw new Error("Lỗi khi gọi server");
            return res.json();
        })
        .then(messages => {
    console.log(messages); // 👉 DÒ XEM JSON TRẢ VỀ
    const box = document.getElementById('chatBox');
    box.innerHTML = '';

    if (!Array.isArray(messages)) {
        console.error("Phản hồi không phải mảng JSON:", messages);
        return;
    }

    messages.forEach(m => {
        const div = document.createElement('div');
        div.className = 'message ' + (m.fromUser ? 'from-user' : 'from-admin');
        const content = document.createElement('div');
content.textContent = m.message;

const time = document.createElement('small');
time.textContent = m.timestamp;

div.appendChild(content);
div.appendChild(time);
box.appendChild(div);
        box.appendChild(div);
    });
    box.scrollTop = box.scrollHeight;
})

            
            

}
loadMessages();
setInterval(loadMessages, 3000);
</script>

</body>
</html>
