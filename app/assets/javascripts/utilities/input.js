document.addEventListener('turbolinks:load', function()
{
    var user_password_confirmation = document.querySelector('#user_password_confirmation');
    var user_password = document.querySelector('#user_password');

    if (user_password) { user_password.addEventListener('input', validatePasswordFields) }
    if (user_password_confirmation) { user_password_confirmation.addEventListener('input', validatePasswordFields) }
});

function validatePasswordFields() {
    var user_password_confirmation = document.querySelector('#user_password_confirmation');
    var user_password = document.querySelector('#user_password');
    console.log(user_password_confirmation.value);
    console.log(user_password.value);

    if ((user_password.value == null || user_password.value == '') && (user_password_confirmation.value == null || user_password_confirmation.value == '')) {
        showFlash('',false);
        console.log('')
    } else if (user_password.value == user_password_confirmation.value) {
        showFlash('Пароли совпадают', true, 'alert-success')
    } else {
        showFlash('Пароли не совпадают!', true, 'alert-warning')
    }
}

function showFlash(msg='', show=true, alert='alert-warning') {
    var flash_div = document.createElement('div');
    flash_div.classList.add('flash');
    flash_div.classList.add('alert');
    flash_div.classList.add(alert);
    if (!show) { flash_div.classList.add('hide') }
    flash_div.classList.add('mt-3');
    flash_div.textContent = msg;

    var current_flash_div = document.querySelector('.flash');
    document.querySelector('.container').replaceChild(flash_div, current_flash_div)
}
