import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./@pages/home/home.module').then(m => m.HomeModule)
  },
  {
    path: 'listado_ventas',
    loadChildren: () => import('./@pages/sales-list/sales-list.module').then(m => m.SalesListModule)
  },
  {
    path: 'ventas',
    loadChildren: () => import('./@pages/sales/sales.module').then(m => m.SalesModule)
  },
  { path: ``, redirectTo: `home`, pathMatch: `full` }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
