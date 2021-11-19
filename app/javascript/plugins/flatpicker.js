import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initFlatpickr = () => {
  const bookingForm = document.getElementById('booking-form-div');
  if (bookingForm) {
    const reservations = JSON.parse(bookingForm.dataset.reservations);
    flatpickr("#range_start", {
      minDate: "today",
      inline: true,
      dateFormat: "Y-m-d",
      "disable": reservations,
    })
  }
};

export { initFlatpickr };
