$(document).ready(function () {
    $(".print-link").click(function () {
        $(this).hide()
        window.print()
        $(this).show()
    })
})