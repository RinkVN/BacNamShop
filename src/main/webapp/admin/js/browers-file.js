const dropArea = document.querySelector(".drop-section");
const listSection = document.querySelector(".list-section");
const listContainer = document.querySelector(".list");
const fileSelector = document.querySelector(".file-selector");
const fileSelectorInput = document.querySelector(".file-selector-input");




fileSelector.addEventListener("mousedown", (event) => {
    event.preventDefault(); // Ngăn chặn hành động mặc định của label
    fileSelectorInput.click();
});

fileSelectorInput.onchange = () => {
    [...fileSelectorInput.files].forEach((file) => {
        if (typeValidation(file.type)) {
            uploadFile(file);
        }
    });
};

let timeout;

// when file is over the drag area
dropArea.ondragover = (e) => {
    e.preventDefault();
    clearTimeout(timeout);
    [...e.dataTransfer.items].forEach((item) => {
        if (typeValidation(item.type)) {
            dropArea.classList.add('drag-over-effect');
        }
    });
};

// when file leave the drag area
dropArea.ondragleave = () => {
    timeout = setTimeout(() => {
        dropArea.classList.remove('drag-over-effect');
    }, 200); // Th�?i gian ch�? trước khi xóa lớp drag-over-effect
};

// when file drop on the drag area
dropArea.ondrop = (e) => {
    e.preventDefault();
    dropArea.classList.remove("drag-over-effect");
    if (e.dataTransfer.items) {
        [...e.dataTransfer.items].forEach((item) => {
            if (item.kind === "bimg") {
                const file = item.getAsFile();
                if (typeValidation(file.type)) {
                    uploadFile(file);
                }
            }
        });
    } else {
        [...e.dataTransfer.files].forEach((file) => {
            if (typeValidation(file.type)) {
                uploadFile(file);
            }
        });
    }
};

// check the file type
function typeValidation(type) {
    var splitType = type.split("/")[0];
    if (
            type == "application/pdf" ||
            splitType == "image" ||
            splitType == "video"
            ) {
        return true;
    }
}

// upload file function
function uploadFile(file) {
    listSection.style.display = "block";
    var li = document.createElement("li");
    li.classList.add("in-prog");
    li.innerHTML = `
    <div class="col">
    <img src="js/icons/${iconSelector(file.type)}" alt="alt"/>
    </div>
    <div class="col">
        <div class="file-name">
            <div class="name"> ${file.name}</div>
            <span>0%</span>
        </div>
        <div class="file-progress">
            <span></span>
        </div>
        <div class="file-size">${(file.size / (1024 * 1024)).toFixed(2)} MB</div>
    </div>
    <div class="col">
        <svg xmlns="http://www.w3.org/2000/svg" class="cross" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"/>
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" class="tick" width="16" height="16" fill="currentColor" class="bi bi-check2-all" viewBox="0 0 16 16">
        <path d="M12.354 4.354a.5.5 0 0 0-.708-.708L5 10.293 1.854 7.146a.5.5 0 1 0-.708.708l3.5 3.5a.5.5 0 0 0 .708 0zm-4.208 7-.896-.897.707-.707.543.543 6.646-6.647a.5.5 0 0 1 .708.708l-7 7a.5.5 0 0 1-.708 0"/>
        <path d="m5.354 7.146.896.897-.707.707-.897-.896a.5.5 0 1 1 .708-.708"/>
        </svg>
    </div>
    `;
    listContainer.prepend(li);
    const xhr = new XMLHttpRequest();
    const  data = new FormData();
    data.append("bimg", file);
    xhr.onload = () => {
        console.log("File uploaded successfully:", file.name);

        li.classList.add("complete");
        li.classList.remove("in-prog");
    };
    xhr.upload.onprogress = (e) => {
        var percent_complete = (e.loaded / e.total) * 100;
        li.querySelectorAll("span")[0].innerHTML =
                Math.round(percent_complete) + "%";
        li.querySelectorAll("span")[1].style.width = percent_complete + "%";
    };
    xhr.open("POST", "../addbooks", true);
    xhr.send(data);
    li.querySelector(".cross").onclick = () => xhr.abort();
    xhr.onabort = () => li.remove();
}
// find icon for file
function iconSelector(type) {
    var splitType =
            type.split("/")[0] == "application"
            ? type.split("/")[1]
            : type.split("/")[0];
    return splitType + ".png";
}
