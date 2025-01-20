@EndUserText.label: 'Root node'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define root view entity Zi_ust_asb_travel as select from /dmo/travel_m
composition[0..*] of Zi_ust_asb_booking as _Booking
composition[0..*] of ZUST_ASB_U_Attachment as _attachment 
association[1] to /DMO/I_Agency as _Agency on 
    $projection.AgencyId = _Agency.AgencyID
association[1] to /DMO/I_Customer as _Customer on
    $projection.CustomerId = _Customer.CustomerID
association[1] to I_Currency as _Currency on
    $projection.CurrencyCode = _Currency.Currency
association[1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on
    $projection.OverallStatus = _OverallStatus.OverallStatus
{
    key travel_id as TravelId,
// coming from S4 standred table 
//    @Consumption.valueHelpDefinition: [{ 
//        entity.name: '/DMO/I_Agency',
//        entity.element: 'AgencyID'
//     }]
//coming from ES5 ssyetm 
     @Consumption.valueHelpDefinition: [{ 
        entity.name: 'ZUST_ASB_AGENCY_ES5',
        entity.element: 'Agency_Id'
     }]
     
    agency_id as AgencyId,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Customer',
        entity.element: 'CustomerID'
     }]
     
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency'
     }]
    currency_code as CurrencyCode,
    description as Description,
    @ObjectModel.text.element: [ 'StatusText' ]
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Overall_Status_VH',
        entity.element: 'OverallStatus'
     }]
    overall_status as OverallStatus,
    case overall_status
        when 'A' then 'Approved'
        when 'X' then 'Rejected'
        when 'O' then 'Open'
        else 'Unknown'
    end as StatusText,
    case overall_status
        when 'A' then 3
        when 'X' then 1
        when 'O' then 2
        else 0
    end as Criticality,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    //Local ETag Field --> Odata Etag
    last_changed_at as LastChangedAt,
    /*Expose associations*/
    _Booking,
    _Agency,
    _Customer,
    _Currency,
    _OverallStatus,
    _attachment
}
    
    
