import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    dateFormat: "Y-m-d",
    disable: [
      {
        from: "2021-11-17",
        to: "2021-11-21"
      },
    ]
  });
}

export { initFlatpickr };
