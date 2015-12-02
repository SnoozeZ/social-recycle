$('#usertabs a').click(function (e) {
    e.preventDefault();
    console.log("1212");
    $(this).tab('show');
});

$('#usertabs a:last').tab('show')
