<template>
  <ul class="list-unstyled">
    <li
      class="border rounded px-2 py-1 mb-2 note-item"
      v-for="(item, index) in noteList"
      :key="index"
    >
      <div class="d-flex justify-content-between align-items-center">
        <p
          class="mb-0 text-secondary text-truncate"
          @click="selectedNote(index)"
        >
          {{ item.content }}
        </p>
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
</template>

<script>
export default {
  name: "NoteList",
  props: {
    noteList: Array,
  },
  methods: {
    selectedNote(index) {
      this.$emit("selectedNote", index);
    },
    deleteNote(index) {
      this.$emit("deletedNote", index);
    },
  },
};
</script>
