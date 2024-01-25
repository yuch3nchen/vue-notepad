<template>
  <div class="container py-3">
    <div class="border border-dark rounded p-3">
      <div class="row">
        <div class="col-12 col-lg-8">
          <div class="d-flex flex-column justify-content-between mb-3">
            <h1>This is a VueNotePad</h1>
            <button
              class="btn btn-secondary align-self-end"
              @click="addNewNote"
            >
              New
            </button>
          </div>
          <textarea
            class="form-control"
            rows="15"
            v-model="content"
            ref="textarea"
          ></textarea>
        </div>
        <div class="col-12 col-lg-4">
          <ul class="list-unstyled">
            <li
              class="border rounded px-2 py-1 mb-2"
              v-for="(item, index) in noteList"
              :key="index"
            >
              {{ item.content }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import autosize from "autosize";
export default {
  data() {
    return {
      content: "",
      noteList: [],
    };
  },
  methods: {
    addNewNote() {
      const newNote = {
        content: this.content,
      };
      this.noteList.push(newNote);
      this.content = "";
    },
  },
  mounted() {
    autosize(this.$refs.textarea);
  },
};
</script>

<style lang="scss"></style>
