$(document).ready(()=>{
    $('#PatientLink').on('click',()=>{
        $('#PatientTable').attr('hidden', false);
        $('#DrugTable').attr('hidden', true);
        $('#InPatientEmpTable').attr('hidden', true);
        $('#OutPatientTable').attr('hidden', true);
        $('#InPatientStuTable').attr('hidden', true);
        $('#SectionTitle').html("Patient List")
    });

    $('#DrugLink').on('click', ()=>{
        $('#PatientTable').attr('hidden', true);
        $('#DrugTable').attr('hidden', false);
        $('#InPatientEmpTable').attr('hidden', true);
        $('#OutPatientTable').attr('hidden', true);
        $('#InPatientStuTable').attr('hidden', true);
        $('#SectionTitle').html("Drugs List");
    });

    $('#InPatientStuLink').on('click', ()=> {
        $('#InPatientStuTable').attr('hidden', false);
        $('#DrugTable').attr('hidden', true);
        $('#PatientTable').attr('hidden', true);
        $('#InPatientEmpTable').attr('hidden', true);
        $('#OutPatientTable').attr('hidden', true);
        $('#SectionTitle').html("In-Patient Student List")
    });

    $('#InPatientEmpLink').on('click', ()=> {
        $('#InPatientEmpTable').attr('hidden', false);
        $('#DrugTable').attr('hidden', true);
        $('#PatientTable').attr('hidden', true);
        $('#InPatientStuTable').attr('hidden', true);
        $('#OutPatientTable').attr('hidden', true);
        $('#SectionTitle').html("In-Patient Emp/Ben List")
    });

    $('#OutPatientLink').on('click', () => {
        $('#OutPatientTable').attr('hidden', false);
        $('#DrugTable').attr('hidden', true);
        $('#PatientTable').attr('hidden', true);
        $('#InPatientEmpTable').attr('hidden', true);
        $('#InPatientStuTable').attr('hidden', true);
        $('#SectionTitle').html("Out-Patient List")
    })
});