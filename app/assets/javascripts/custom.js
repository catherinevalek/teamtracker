$(document).ready(function() {
    $('#team-table').DataTable( {
    "lengthMenu": [[5, 10, -1], [5, 10, "All"]],
    "pageLength": -1
    } );
});