<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Trò chuyện với khách hàng</title>
    <style>
        body { font-family: Arial; margin: 0; padding: 0; }
        .container { display: flex; height: 100vh; }
        .sidebar {
            width: 25%; background-color: #f1f1f1; border-right: 1px solid #ccc;
            overflow-y: auto; padding: 10px;
        }
        .chat-panel { width: 75%; display: flex; flex-direction: column; padding: 10px; }
        .chat-box {
            flex: 1; overflow-y: auto; border: 1px solid #ccc;
            padding: 10px; margin-bottom: 10px; display: flex; flex-direction: column;
        }
        .message {
            padding: 8px; margin: 5px 0; border-radius: 6px; max-width: 70%;
        }
        .from-user { background-color: #e0f7fa; align-self: flex-start; }
        .from-admin { background-color: #f8d7da; align-self: flex-end; }
        .message small { display: block; font-size: 10px; color: gray; }
        form#sendForm { display: flex; gap: 5px; }
        form#sendForm input[type="text"] {
            flex: 1; padding: 8px;
        }
        .customer-btn {
            display: block; margin-bottom: 8px; padding: 8px;
            background-color: #fff; border: 1px solid #ccc;
            text-align: left; cursor: pointer;
        }
        .customer-btn.active { background-color: #d9edf7; }
    </style>
</head>
<body>

<div class="container">
    <!-- Danh sách khách hàng -->
    <div class="sidebar">
        <h3>Khách hàng</h3>
        <div id="customerList"></div>
    </div>

    <!-- Khung chat -->
    <div class="chat-panel">
        <h3 id="chatWith">Chọn khách hàng để trò chuyện</h3>

        <div class="chat-box" id="chatBox"></div>

        <form id="sendForm" onsubmit="sendMessage(event)">
            <input type="text" id="messageInput" placeholder="Nhập tin..." required />
            <input type="hidden" id="customerIdInput" />
            <button type="submit">Gửi</button>
        </form>
    </div>
</div>

<script>
let selectedCustomerId = null;

// Load danh sách khách hàng
function loadCustomers() {
    fetch('/PRJ301_Assignment/admin/customers-chat')
        .then(res => res.json())
        .then(customers => {
            const list = document.getElementById('customerList');
            list.innerHTML = '';
            customers.forEach(c => {
                const btn = document.createElement('button');
                btn.className = 'customer-btn';
                btn.innerText = c.fullName;
                btn.onclick = () => {
                    document.querySelectorAll('.customer-btn').forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');
                    selectedCustomerId = c.id;
                    document.getElementById('customerIdInput').value = c.id;
                    document.getElementById('chatWith').innerText = 'Đang trò chuyện với: ' + c.fullName;
                    loadMessages();
                };
                list.appendChild(btn);
            });
        });
}

// Load tin nhắn của khách được chọn
function loadMessages() {
    if (!selectedCustomerId) return;

    fetch('/PRJ301_Assignment/admin/chat-ajax?cid=' + selectedCustomerId)
        .then(response => response.json())
        .then(messages => {
            const box = document.getElementById('chatBox');
            box.innerHTML = '';
            messages.forEach(m => {
                const div = document.createElement('div');
                div.className = 'message ' + (m.fromUser ? 'from-user' : 'from-admin');

                const content = document.createElement('div');
                const bold = document.createElement('b');
                bold.textContent = m.senderName + ':';
                content.appendChild(bold);
                content.appendChild(document.createTextNode(' ' + m.message));

                const time = document.createElement('small');
                time.textContent = m.timestamp;

                div.appendChild(content);
                div.appendChild(time);
                box.appendChild(div);
            });
            box.scrollTop = box.scrollHeight;
        });
}

// Gửi tin nhắn từ admin
function sendMessage(e) {
    e.preventDefault();
    const msg = document.getElementById('messageInput').value;
    const customerId = document.getElementById('customerIdInput').value;
    if (!customerId) return;

    const formData = new URLSearchParams();
    formData.append("customerId", customerId);
    formData.append("message", msg);

    fetch('/PRJ301_Assignment/admin/chat', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: formData
    }).then(() => {
        document.getElementById('messageInput').value = '';
        loadMessages();
    });
}

loadCustomers();
setInterval(() => {
    if (selectedCustomerId) loadMessages();
}, 3000);
</script>

</body>
</html>
