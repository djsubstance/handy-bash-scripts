// Will check if cookies are enabled if not enable them
   if (!navigator.cookieEnabled) {
                window.addEventListener('DOMContentLoaded', function() {
                    var cookieEl = document.getElementById('cookie-alert');
                    cookieEl.style.display = 'block';
                })
            }

