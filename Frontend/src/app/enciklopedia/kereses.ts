import { Pipe, PipeTransform } from '@angular/core';
@Pipe({
  standalone: true,
  name: 'filter'
})
export class Kereses implements PipeTransform {
  transform(gombak: any[], searchText: string): any[] {
    if(!gombak) return [];
    if(!searchText) return gombak;
    searchText = searchText.toLowerCase();
    return gombak.filter( it => {
      return it.Magyar_nev.toLowerCase().includes(searchText) || it.Latin_nev.toLowerCase().includes(searchText)
    });
  }
}
