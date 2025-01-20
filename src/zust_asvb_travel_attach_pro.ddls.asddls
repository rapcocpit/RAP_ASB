@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'attachemnt Data Defincation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZUST_ASVB_Travel_Attach_PRO as projection on ZUST_ASB_U_Attachment
{
    key TravelId,
    key Id,
    Memo,
    Attachment,
    Filename,
    Filetype,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _travel : redirected to parent Zust_Asb_travel_projection
}
