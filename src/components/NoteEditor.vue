<template>
  <div class="d-flex flex-column gap-2">
    <button class="btn btn-secondary align-self-end" @click="addNewNote">
      <i class="fa-solid fa-plus me-1"></i>New
    </button>
    <textarea
      class="form-control fs-4"
      rows="15"
      v-for="(note, index) in noteList"
      v-show="note.isShowed"
      v-model.trim="note.content"
      :key="index"
      ref="textarea"
      placeholder="type here..."
      @keyup="toastAlert"
    ></textarea>
  </div>
</template>

<script>
import autosize from "autosize";
export default {
  name: "NoteEditor",
  props: { noteList: Array },
  methods: {
    addNewNote() {
      this.$emit("addNewNote");
    },
    toastAlert() {
      this.$emit("toastAlert");
    },
  },
  mounted() {
    autosize(this.$refs.textarea);
  },
};
</script>
