<template>
  <div class="container py-3">
    <div class="border border-dark rounded p-3">
      <div class="row g-3">
        <div class="col-12 col-lg-8">
          <div class="d-flex flex-column justify-content-between mb-3">
            <h1 class="fw-bold display-3">This is a VueNotePad</h1>
            <button
              class="btn btn-secondary align-self-end"
              @click="addNewNote"
            >
              <i class="fa-solid fa-plus me-1"></i>New
            </button>
          </div>
          <textarea
            class="form-control"
            rows="15"
            v-for="(note, index) in noteList"
            v-show="note.isShowed"
            v-model="note.content"
            :key="index"
            ref="textarea"
            placeholder="type here..."
          ></textarea>
        </div>
        <div class="col-12 col-lg-4">
          <ul class="list-unstyled">
            <li
              class="border rounded px-2 py-1 mb-2"
              v-for="(item, index) in noteList"
              :key="index"
            >
              <div class="d-flex justify-content-between align-items-center">
                <p class="mb-0 text-secondary">{{ item.content }}</p>
                <div class="d-flex gap-1">
                  <button class="btn" @click="selectedNote(index)">
                    <i class="fa-solid fa-pen-to-square"></i>
                  </button>
                  <button class="btn" @click="deleteNote(index)">
                    <i class="fa-solid fa-trash"></i>
                  </button>
                </div>
              </div>
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
      noteList: [
        {
          content: "",
          isShowed: true,
        },
      ],
    };
  },
  methods: {
    addNewNote() {
      this.closeAllNotes();
      const newNote = {
        content: this.content,
        isShowed: true,
      };
      this.noteList.push(newNote);
      this.content = "";
    },
    closeAllNotes() {
      this.noteList.map((item) => {
        item.isShowed = false;
      });
    },
    selectedNote(idx) {
      this.closeAllNotes();
      this.noteList[idx].isShowed = true;
    },
    deleteNote(idx) {
      const del_confirmed = confirm("確認要刪除這則筆記？");
      if (del_confirmed) {
        const noteLength = this.noteList.length;
        if (noteLength == 1) {
          this.noteList.splice(idx, 1);
          this.addNewNote();
        } else {
          this.noteList.splice(idx, 1);
          this.closeAllNotes();
          this.noteList[this.noteList.length - 1].isShowed = true;
        }
      } else return;
    },
    loadLocalStorage() {
      localStorage.getItem("noteStorage")
        ? (this.noteList = JSON.parse(localStorage.getItem("noteStorage")))
        : this.addNewNote();
    },
  },
  watch: {
    noteList: {
      handler() {
        localStorage.setItem("noteStorage", JSON.stringify(this.noteList));
      },
      deep: true,
    },
  },
  mounted() {
    autosize(this.$refs.textarea), this.loadLocalStorage();
  },
};
</script>

<style lang="scss"></style>
