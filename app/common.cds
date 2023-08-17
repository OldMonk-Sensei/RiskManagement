using riskmanagement as rm from '../db/schema';
//Annotate riskmanagement 
annotate rm.Risks with {
   ID @title: 'Risk';
   title @title : 'Title';
   owner @title : 'Owner';
   prio @title : 'Priority';
   descr @title : 'Description';
   miti @title : 'Mitigation';
   impact @title : 'Impact';
   bp @title : 'Business Partner';
   criticality @title : 'Criticality';
}
annotate rm.Mitigations with {
    ID @(UI.Hidden, Common: {Text:descr} );
    descr @title: 'Description';
    owner @title : 'Owner';
};
annotate rm.BusinessPartners with {
    BusinessPartner @(
        UI.Hidden,
        common: {Text: LastName}
    );
    LastName @title: 'Last Name';
    FirstName @title : 'First Name';
};


annotate rm.Risks with {
    miti @(common:{
        Text: miti.descr,
        TextArrangement : #TextOnly,
        ValueList: {
            Label          : 'Mitigations',
            CollectionPath : 'Mitigations',
            Parameters     : [
                {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID'
                },
                {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr'
                }
            ]
        }
    });
    bp @(common: {
        Text: bp.LastName,
        TextArrangement: #TextOnly,
        ValueList: {
            Label: 'Business partners',
            CollectionPath: 'BusinessPartners',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: bp_BusinessPartner,
                    ValueListProperty: 'BusinessPartner'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'LastName'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'FirstName'
                }
            ]
        }
    })

};

