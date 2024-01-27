<template>
  <div
    ref="alertBox"
    class="position-absolute bottom-0 start-50 translate-middle border shadow py-2 px-3 rounded text-success d-none"
  >
    <i class="fa-solid fa-circle-check"></i>
    <span class="fw-bold ms-1">Your note has saved.</span>
  </div>
</template>
<script>
export default {
  name: "AlertBox",
  methods: {
    toastAlert() {
      this.$emit("toastAlert");
    },
  },
};
</script>
