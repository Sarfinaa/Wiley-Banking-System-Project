import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CustomerService } from 'src/app/services/customer/customer.service';

@Component({
  selector: 'app-customer-dashboard',
  templateUrl: './customer-dashboard.component.html',
  styleUrls: ['./customer-dashboard.component.css'],
})
export class CustomerDashboardComponent implements OnInit {
  customerId: number = 0;
  accBalance: Object = 0;
  constructor(private router: Router, private activatedRoute: ActivatedRoute, private customerService: CustomerService) { }

  ngOnInit(): void {
    this.customerId = this.activatedRoute.snapshot.params.id;
    this.getAccountBalance();
  }

  redirectTo(type: string) {
    if (type == 'transactions')
      this.router.navigate([`customer/${this.customerId}/transactions`]);
    else
      this.router.navigate([`customer/${this.customerId}/transaction/${type}`]);
  }
  getAccountBalance() {
    this.customerService
      .getAccountBalance(this.customerId)
      .subscribe(
        (res) => {
          this.accBalance = Number(res);
        },
        (err) => {
          console.log('err', err);
        }
      );
  }
}
