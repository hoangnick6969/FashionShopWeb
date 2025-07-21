<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>AI Assistant</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .chat-container {
            width: 100%;
            max-width: 600px;
            height: 90vh;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
        }
        .chat-box {
            flex: 1;
            overflow-y: auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            scroll-behavior: smooth;
        }
        .message {
            padding: 12px 18px;
            border-radius: 20px;
            max-width: 75%;
            font-size: 15px;
            line-height: 1.5;
            word-wrap: break-word;
            overflow-wrap: break-word;
        }
        .user {
            align-self: flex-end;
            background-color: #dcf8c6;
        }
        .bot {
            align-self: flex-start;
            background-color: #f1f0f0;
        }
        .chat-input {
            display: flex;
            border-top: 1px solid #ccc;
            padding: 10px;
        }
        .chat-input input[type=text] {
            flex: 1;
            padding: 10px 15px;
            border: 1px solid #ccc;
            border-radius: 20px;
            font-size: 15px;
            outline: none;
        }
        .chat-input button {
            margin-left: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 20px;
            font-size: 15px;
            cursor: pointer;
        }
        .chat-input button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="chat-container">
    <div class="chat-box" id="chat-box">
        <c:forEach var="msg" items="${chatHistory}">
            <div class="message ${msg.sender}">${msg.message}</div>
        </c:forEach>
    </div>
    <div class="chat-input">
        <input type="text" id="msgInput" placeholder="Nhập nội dung..." />
        <button onclick="sendMessage()">Gửi</button>
    </div>
</div>

<script>
    const chatBox = document.getElementById("chat-box");
    const input = document.getElementById("msgInput");

    function scrollToBottom() {
        chatBox.scrollTop = chatBox.scrollHeight;
    }

    scrollToBottom();

   function sendMessage() {
    const message = input.value.trim();
    if (!message) return;

    const userMsg = document.createElement("div");
    userMsg.className = "message user";
    userMsg.textContent = message;
    chatBox.appendChild(userMsg);
    scrollToBottom();

    fetch("${pageContext.request.contextPath}/user/chat", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "message=" + encodeURIComponent(message)
    })
    .then(res => res.json())
    .then(data => {
        const botMsg = document.createElement("div");
        botMsg.className = "message bot";
        botMsg.textContent = data.bot;
        chatBox.appendChild(botMsg);
        scrollToBottom();
    })
    .catch(err => {
        const errMsg = document.createElement("div");
        errMsg.className = "message bot";
        errMsg.textContent = "Đã xảy ra lỗi. Vui lòng thử lại sau.";
        chatBox.appendChild(errMsg);
        scrollToBottom();
    });

    input.value = "";
}

</script>
</body>
</html>
