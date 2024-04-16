import csv

# Classe para armazenar os dados de cada produto
class Produto:
    def __init__(self, descricao, valor, tipo_embalagem):
        self.descricao = descricao
        self.valor = valor
        self.tipo_embalagem = tipo_embalagem

# Função para pedir as informações de cada produto ao usuário
def solicitar_informacoes_produto():
    while True:
        try:
            descricao = input("Digite a descrição do produto: ")
            valor_input = input("Digite o valor do produto (ex: 19.99): ")
            tipo_embalagem = input("Digite o tipo de embalagem do produto: ")

            valor = float(valor_input)
            return Produto(descricao, valor, tipo_embalagem)
        except ValueError:
            print("Erro: O valor do produto precisa ser um número. Por favor, tente novamente.")

# Função principal que gerencia o fluxo de entrada e gravação dos dados
def main():
    produtos = []

    while True:
        produto = solicitar_informacoes_produto()
        produtos.append(produto)

        continuar = input("Deseja cadastrar um novo produto? (sim/não): ")
        if continuar.lower() != 'sim':
            break

    # Verificar se há pelo menos 5 produtos antes de criar o arquivo CSV
    if len(produtos) >= 5:
        with open('1_5_arquivo_produto.csv', 'w', newline='') as arquivo:
            escritor = csv.writer(arquivo)
            escritor.writerow(['Descrição', 'Valor', 'Tipo de Embalagem'])  # Cabeçalho do CSV
            for p in produtos:
                escritor.writerow([p.descricao, p.valor, p.tipo_embalagem])
        print("Arquivo CSV foi criado com sucesso.")
    else:
        print("Não foram cadastrados produtos suficientes para criar o arquivo CSV.")

# Executa o programa
if __name__ == '__main__':
    main()
