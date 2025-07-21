/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

// previewPost.js

function previewPost() {
    const title = document.getElementById('title').value.trim();
    const content = document.getElementById('content').value.trim();
    const excerpt = document.getElementById('excerpt').value.trim();
    const previewContent = document.getElementById('previewContent');

    if (!title || !content) {
        alert('Vui lòng nhập tiêu đề và nội dung để xem trước');
        return;
    }

    // Format the content (convert new lines to <br>)
    const formattedContent = content.replace(/\n/g, '<br>');

    // Construct the HTML
    const html = `
        <article class="blog-preview">
            <header class="mb-4">
                <h1 class="display-5 fw-bold text-primary">${title}</h1>
                ${excerpt ? `<p class="lead text-muted">${excerpt}</p>` : ''}
                <hr class="my-4">
            </header>
            <div class="blog-content">
                ${formattedContent}
            </div>
        </article>
    `;

    // Inject and display
    previewContent.innerHTML = html;

    const modalElement = document.getElementById('previewModal');
    const previewModal = new bootstrap.Modal(modalElement);
    previewModal.show();
}



