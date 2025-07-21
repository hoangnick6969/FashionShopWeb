
</div>

<!-- Enhanced Admin Footer -->
<footer class="admin-footer bg-white border-top mt-5">
    <div class="container-fluid px-4 py-3">
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="d-flex align-items-center">
                    <div class="me-3">
                        <div class="bg-gradient-primary p-2 rounded-circle text-white">
                            <i class="bi bi-shield-check"></i>
                        </div>
                    </div>
                    <div>
                        <h6 class="mb-0 text-primary fw-bold">FashionShop Admin</h6>
                        <small class="text-muted">H? th?ng qu?n lý th?i trang</small>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="d-flex justify-content-md-end justify-content-start align-items-center">
                    <div class="footer-links me-4">
                        <a href="${pageContext.request.contextPath}/admin/help" class="text-decoration-none text-muted me-3 hover-primary">
                            <i class="bi bi-question-circle me-1"></i>Tr? giúp
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/support" class="text-decoration-none text-muted me-3 hover-primary">
                            <i class="bi bi-headset me-1"></i>H? tr?
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/docs" class="text-decoration-none text-muted hover-primary">
                            <i class="bi bi-book me-1"></i>Tài li?u
                        </a>
                    </div>
                    <div class="system-status">
                        <div class="d-flex align-items-center">
                            <div class="status-indicator bg-success rounded-circle me-2" style="width: 8px; height: 8px;"></div>
                            <small class="text-success fw-semibold">H? th?ng ho?t ??ng bình th??ng</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <hr class="my-3 opacity-50">
        
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="d-flex align-items-center">
                    <small class="text-muted">
                        © 2024 <strong class="text-primary">FashionShop</strong>. T?t c? quy?n ???c b?o l?u.
                    </small>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="d-flex justify-content-md-end justify-content-start align-items-center">
                    <div class="admin-stats me-4">
                        <small class="text-muted d-flex align-items-center">
                            <i class="bi bi-clock me-1"></i>
                            Phiên b?n: <span class="text-primary fw-semibold ms-1">v2.1.0</span>
                        </small>
                    </div>
                    
                    <div class="social-links">
                        <a href="#" class="text-muted me-2 hover-primary" data-bs-toggle="tooltip" title="Facebook">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a href="#" class="text-muted me-2 hover-primary" data-bs-toggle="tooltip" title="Twitter">
                            <i class="bi bi-twitter"></i>
                        </a>
                        <a href="#" class="text-muted me-2 hover-primary" data-bs-toggle="tooltip" title="Instagram">
                            <i class="bi bi-instagram"></i>
                        </a>
                        <a href="#" class="text-muted hover-primary" data-bs-toggle="tooltip" title="LinkedIn">
                            <i class="bi bi-linkedin"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<style>
    .admin-footer {
        margin-left: var(--sidebar-width);
        box-shadow: 0 -2px 10px rgba(0,0,0,0.05);
        background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%) !important;
    }
    
    .hover-primary:hover {
        color: var(--admin-accent) !important;
        transition: all 0.3s ease;
        transform: translateY(-1px);
    }
    
    .status-indicator {
        animation: pulse-success 2s infinite;
    }
    
    @keyframes pulse-success {
        0% { box-shadow: 0 0 0 0 rgba(40, 167, 69, 0.4); }
        70% { box-shadow: 0 0 0 10px rgba(40, 167, 69, 0); }
        100% { box-shadow: 0 0 0 0 rgba(40, 167, 69, 0); }
    }
    
    .footer-links a:hover {
        color: var(--admin-accent) !important;
    }
    
    .social-links a {
        transition: all 0.3s ease;
        padding: 0.25rem;
        border-radius: 0.25rem;
    }
    
    .social-links a:hover {
        background: rgba(52, 152, 219, 0.1);
        transform: translateY(-2px);
    }
    
    @media (max-width: 768px) {
        .admin-footer {
            margin-left: 0;
        }
        
        .footer-links {
            margin-bottom: 1rem !important;
        }
        
        .system-status, .admin-stats {
            margin-bottom: 0.5rem;
        }
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Footer initialization script -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Initialize tooltips for social links
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
        
        // Add smooth hover effects
        document.querySelectorAll('.hover-primary').forEach(element => {
            element.addEventListener('mouseenter', function() {
                this.style.transition = 'all 0.3s ease';
            });
        });
    });
</script>

</body>
</html>
