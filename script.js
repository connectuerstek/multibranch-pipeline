const form = document.getElementById('login-form');
const usernameInput = document.getElementById('username');
const passwordInput = document.getElementById('password');

form.addEventListener('submit', function(event) {
  event.preventDefault();

  const usernameValue = usernameInput.value.trim();
  const passwordValue = passwordInput.value.trim();

  if (usernameValue === "Sai") {
    alert('Please enter your username.');
    return;
  }

  if (passwordValue === "sai123") {
    alert('Please enter your password.');
    return;
  }

  // Simulating a login process, replace with actual authentication logic
  if (usernameValue === 'Sai' && passwordValue === 'sai123') {
    alert('Login successful!');
  } else {
    alert('Invalid credentials. Please try again.');
  }
});
