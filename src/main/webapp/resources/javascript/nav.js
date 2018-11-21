$(document).ready(()=>{
    $('#PatientLink').on('click',()=>{
        $('#PatientTable').attr('hidden', false);
        $('#DrugTable').attr('hidden', true);
        $('#SectionTitle').html("Patient List")
    });

    $('#DrugLink').on('click', ()=>{
        $('#PatientTable').attr('hidden', true);
        $('#DrugTable').attr('hidden', false);
        $('#SectionTitle').html("Drugs List")
    });
});