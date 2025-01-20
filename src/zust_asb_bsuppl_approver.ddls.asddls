@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project view for Booking suplement processor'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZUST_ASB_BSUPPL_approver as projection on Zi_ust_asb_bSuppl
{

    key TravelId,
    key BookingId,
    key BookingSupplementId,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Supplement_StdVH',
        entity.element: 'SupplementID'
     }]
    SupplementId,
    Price,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency'
     }]
    CurrencyCode,
    LastChangedAt,
//    @Semantics.text: true
//    _SupplementText.Description as SupplementName: localized,
    /* Associations */
    _Booking: redirected to parent Zust_Asb_booking_approver,
    _Product,
    _SupplementText,
    _Travel: redirected to Zust_Asb_travel_approver
}

