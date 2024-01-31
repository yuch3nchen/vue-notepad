<template>
  <div class="container py-3">
    <div class="border border-dark rounded p-3">
      <div class="row g-3">
        <div class="col-12 col-lg-8 position-relative">
          <h1 class="fw-bold display-3 font-Agbalumo">This is a VueNotePad</h1>
          <NoteEditor
            :noteList="noteList"
            @addNewNote="addNewNote"
            @toastAlert="toastAlert"
          ></NoteEditor>
          <div
            ref="alertBox"
            class="position-absolute bottom-0 start-50 translate-middle border shadow py-2 px-3 rounded text-success d-none"
          >
            <!-- <font-awesome-icon icon="fa-solid fa-user-secret" /> -->
            <span class="fw-bold ms-1">Your note has saved.</span>
          </div>
        </div>
        <div class="col-12 col-lg-4">
          <NoteList
            :noteList="noteList"
            @selectedNote="selectedNote"
            @deleteNote="deleteNote"
          ></NoteList>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import NoteEditor from "./components/NoteEditor.vue";
import NoteList from "./components/NoteList.vue";

export default {
  name: "App",
  components: {
    NoteEditor,
    NoteList,
  },
  data() {
    return {
      noteList: [],
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
      this.noteList.forEach((item) => {
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
          if (this.noteList[idx].content == "") return;
          this.noteList.splice(idx, 1);
          this.addNewNote();
        } else {
          this.noteList.splice(idx, 1);
          this.closeAllNotes();
          this.noteList[this.noteList.length - 1].isShowed = true;
        }
      } else return;
    },
    toastAlert() {
      const alertBox = this.$refs.alertBox;
      setTimeout(() => {
        alertBox.classList.remove("d-none");

        setTimeout(() => {
          alertBox.classList.add("d-none");
        }, 2000);
      }, 1500);
    },
    loadLocalStorage() {
      localStorage.getItem("noteStorage")
        ? (this.noteList = JSON.parse(localStorage.getItem("noteStorage")))
        : (this.noteList = []);
    },
  },
  watch: {
    noteList: {
      handler: function () {
        localStorage.setItem("noteStorage", JSON.stringify(this.noteList));
      },
      deep: true,
    },
  },
  mounted() {
    this.loadLocalStorage();
  },
};
</script>

<style lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Agbalumo&display=swap");
.font-Agbalumo {
  font-family: "Agbalumo", system-ui;
}
</style>
