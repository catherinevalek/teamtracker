// $(document).ready(function() {
//     $('.index-table').DataTable( {
//     "lengthMenu": [[5, 10, -1], [5, 10, "All"]],
//     "pageLength": -1,
//     dom: 'Bfrtip',
//     buttons: [
//         {
//             extend: 'excel',
//             text: 'Save current page',
//             exportOptions: {
//                 modifier: {
//                     page: 'current'
//                 }
//             }
//         }
//     ]
//     } );
// });


$(document).ready(function() {
    var table = $('.index-table').DataTable( {
    "lengthMenu": [[5, 10, -1], [5, 10, "All"]],
    "pageLength": -1,
    dom: 'Bfltip',
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
          { "orderable": false, "targets": [-2, 2] },
          // { "searchable": false, "targets": [-1, 1] }
        ]


    } );
 
    table.buttons().container()
        .insertBefore( '.index-table_filter' );
} );