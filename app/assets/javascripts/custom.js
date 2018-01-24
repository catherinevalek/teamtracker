
$(document).ready(function() {
    var teamTable = $('#team-table').DataTable( {
    "lengthMenu": [[5, 10, -1], [5, 10, "All"]],
    "pageLength": -1,
    buttons: [
        {
            extend: 'csvHtml5',
            text: 'Save current page',
            exportOptions: {
                modifier: {
                    page: 'current'
                }
            }
        }
    ],

        "columnDefs": [
          { "orderable": false, "targets": [-2] },
        ]


    } );
 
    teamTable.buttons().container()
        .appendTo( '#team-table_wrapper .col-md-6:eq(0)' );

        var playerTable = $('#player-table').DataTable( {
    "lengthMenu": [[5, 10, -1], [5, 10, "All"]],
    "pageLength": -1,
    buttons: [
        {
            extend: 'csvHtml5',
            text: 'Save current page',
            exportOptions: {
                modifier: {
                    page: 'current'
                }
            }
        }
    ],


    } );
 
    playerTable.buttons().container()
        .appendTo( '#player-table_wrapper .col-md-6:eq(0)' );

            var positionTable = $('#position-table').DataTable( {
    "lengthMenu": [[5, 10, -1], [5, 10, "All"]],
    "pageLength": -1,
    buttons: [
        {
            extend: 'csvHtml5',
            text: 'Save current page',
            exportOptions: {
                modifier: {
                    page: 'current'
                }
            }
        }
    ],

    } );
 
    positionTable.buttons().container()
    .appendTo( '#position-table_wrapper .col-md-6:eq(0)' );


    $('.buttons-csv').each(function() {
   $(this).removeClass('dt-button').addClass('btn-sm btn-primary form-control form-control-sm')
})

} );




