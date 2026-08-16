const LOGIN_API = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1' 
    ? 'http://localhost:8080/api/users' 
    : 'https://mini-music-streaming.onrender.com/api/users';

document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('loginForm');
    const registerForm = document.getElementById('registerForm');
    const errorMsg = document.getElementById('errorMessage');

    if (loginForm) {
        loginForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            try {
                const res = await fetch(`${LOGIN_API}/login`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ email, password })
                });

                if (res.ok) {
                    const user = await res.json();
                    localStorage.setItem('musicAppUser', JSON.stringify(user));
                    window.location.href = 'home.html';
                } else {
                    const err = await res.json();
                    errorMsg.textContent = err.error || 'Login failed';
                    errorMsg.style.display = 'block';
                }
            } catch (error) {
                errorMsg.textContent = 'Server error. Is the backend running?';
                errorMsg.style.display = 'block';
            }
        });
    }

    if (registerForm) {
        registerForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            try {
                const res = await fetch(`${LOGIN_API}/register`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ name, email, password })
                });

                if (res.ok) {
                    // Redirect to login after successful registration
                    window.location.href = 'login.html';
                } else {
                    const err = await res.json();
                    errorMsg.textContent = err.error || 'Registration failed';
                    errorMsg.style.display = 'block';
                }
            } catch (error) {
                errorMsg.textContent = 'Server error. Is the backend running?';
                errorMsg.style.display = 'block';
            }
        });
    }
});
