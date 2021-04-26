import { Component, Input, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModalContentComponent } from '../modal-content/modal-content.component';

@Component({
  selector: 'app-modal',
  templateUrl: './modal.component.html',
  styleUrls: ['./modal.component.css']
})
export class ModalComponent {
  @Input() titleButton;
  @Input() data;
  constructor(private modalService: NgbModal) { }

  open() {
    const modalRef = this.modalService.open(ModalContentComponent);
    console.log(this.data);
    modalRef.componentInstance.dataContent = this.data;

  }

}
